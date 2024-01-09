package com.example.MarketApp.Recipify.C_RecipeIngredient;

import com.example.MarketApp.business.base.entity.BaseEntity;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;

@Entity
@Table(name = "c_recipeingredient")
public class C_RecipeIngredient extends BaseEntity {
    public C_RecipeIngredient() {
    }
}
