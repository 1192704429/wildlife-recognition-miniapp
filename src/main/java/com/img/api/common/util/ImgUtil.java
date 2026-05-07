package com.img.api.common.util;

import cn.hutool.http.HttpUtil;
import cn.hutool.json.JSONObject;
import cn.hutool.json.JSONUtil;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.img.api.dto.ImgResult;
import lombok.extern.slf4j.Slf4j;
import okhttp3.*;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.util.*;

/**
 * 图片识别
 */
@Component
@Slf4j
public class ImgUtil {

    @Value("${baiduImg.key}")
    String key;

    @Value("${baiduImg.secret}")
    String secret;

    static final OkHttpClient HTTP_CLIENT = new OkHttpClient().newBuilder().build();

    /**
     * 图片识别
     *
     * @param imgUrl  图片地址
     * @param hasInfo 是否需要百科
     * @return
     * @throws IOException
     */
    public List<ImgResult> imageRecognition(String imgUrl, boolean hasInfo, Integer type) throws IOException {
        log.info("百度智能图片识别开始");
        String typeStr = type.equals(0) ? "plant" : "animal";
        FormBody.Builder formBodyBuilder = new FormBody.Builder();
        formBodyBuilder.add("image", Objects.requireNonNull(convertImageUrlToBase64(imgUrl)));
        formBodyBuilder.add("top_num", "1");
        if (hasInfo) {
            formBodyBuilder.add("baike_num", "1");
        }
        String accessToken = getAccessToken();
        RequestBody body = formBodyBuilder.build();
        Request request = new Request.Builder()
                .url("https://aip.baidubce.com/rest/2.0/image-classify/v1/" + typeStr + "?access_token=" + accessToken)
                .method("POST", body)
                .addHeader("Content-Type", "application/x-www-form-urlencoded")
                .addHeader("Accept", "application/json").build();
        Response response = HTTP_CLIENT.newCall(request).execute();
        String string = response.body().string();
        log.info("百度智能图片识别结束，响应结果：{}", string);
        return processResponse(string);
    }

    // 处理 JSON 响应结果的方法
    public static List<ImgResult> processResponse(String jsonResponse) {
        List<ImgResult> results = new ArrayList<>();
        // 解析 JSON 字符串为 JSONObject
        com.alibaba.fastjson.JSONObject jsonObject = JSON.parseObject(jsonResponse);
        // 获取 result 数组
        JSONArray resultArray = jsonObject.getJSONArray("result");
        if (resultArray != null) {
            for (int i = 0; i < resultArray.size(); i++) {
                com.alibaba.fastjson.JSONObject resultObj = resultArray.getJSONObject(i);
                // 提取动物名称
                String name = resultObj.getString("name");
                // 提取置信度
                String score = resultObj.getString("score");
                // 提取百科信息
                com.alibaba.fastjson.JSONObject baikeInfo = resultObj.getJSONObject("baike_info");
                String baikeUrl = baikeInfo.getString("baike_url");
                String imageUrl = baikeInfo.getString("image_url");
                String description = baikeInfo.getString("description");
                // 创建 AnimalResult 对象并添加到列表中
                ImgResult animalResult = new ImgResult(name, score, baikeUrl, imageUrl, description);
                results.add(animalResult);
            }
        }
        return results;
    }

    /**
     * 从用户的AK，SK生成鉴权签名（Access Token）
     *
     * @return 鉴权签名（Access Token）
     * @throws IOException IO异常
     */
    String getAccessToken() throws IOException {
        log.info("百度智能图片识别获取token开始");
        MediaType mediaType = MediaType.parse("application/x-www-form-urlencoded");
        RequestBody body = RequestBody.create(mediaType, "grant_type=client_credentials&client_id=" + key + "&client_secret=" + secret);
        Request request = new Request.Builder().url("https://aip.baidubce.com/oauth/2.0/token").method("POST", body).addHeader("Content-Type", "application/x-www-form-urlencoded").build();
        Response response = HTTP_CLIENT.newCall(request).execute();
        String string = response.body().string();
        log.info("百度智能图片识别获取token结束，响应结果：{}", string);
        return new JSONObject(string).getStr("access_token");
    }

    /**
     * 将图片链接转换为 Base64 编码字符串
     *
     * @param imageUrl 图片的 URL 链接
     * @return 图片的 Base64 编码字符串，如果出现异常则返回 null
     */
    public static String convertImageUrlToBase64(String imageUrl) {
        try (InputStream inputStream = new URL(imageUrl).openStream(); ByteArrayOutputStream outputStream = new ByteArrayOutputStream()) {
            byte[] buffer = new byte[4096];
            int bytesRead;
            while ((bytesRead = inputStream.read(buffer)) != -1) {
                outputStream.write(buffer, 0, bytesRead);
            }
            byte[] imageBytes = outputStream.toByteArray();
            return Base64.getEncoder().encodeToString(imageBytes);
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }

}
