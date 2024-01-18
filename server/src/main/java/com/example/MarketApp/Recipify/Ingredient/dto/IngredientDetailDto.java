package com.example.MarketApp.Recipify.Ingredient.dto;

public class IngredientDetailDto {
    private Long id;
    private String name;

    public IngredientDetailDto() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
