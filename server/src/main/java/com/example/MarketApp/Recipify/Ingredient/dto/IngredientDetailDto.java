package com.example.MarketApp.Recipify.Ingredient.dto;

import com.example.MarketApp.business.base.dto.BaseDetailDto;

public class IngredientDetailDto extends BaseDetailDto {
    private String name;

    public IngredientDetailDto() {
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}