package com.img.api.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ImgResult {

    private String name;

    private String score;

    private String baikeUrl;

    private String imageUrl;

    private String description;

}
