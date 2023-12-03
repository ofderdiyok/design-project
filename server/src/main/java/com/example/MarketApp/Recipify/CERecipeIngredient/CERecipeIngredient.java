package com.example.MarketApp.Recipify.CERecipeIngredient;

import com.example.MarketApp.Recipify.Ingredient.Ingredient;
import com.example.MarketApp.Recipify.Recipe.Recipe;
import com.example.MarketApp.business.base.entity.BaseEntity;
import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "CERecipeIngredient")
public class CERecipeIngredient extends BaseEntity {

    @ManyToOne(cascade = CascadeType.DETACH)
    @JoinColumn(name = "recipe_id")
    private Recipe recipe;

    @ManyToOne(cascade = CascadeType.DETACH)
    @JoinColumn(name = "ingredient_id")
    private Ingredient ingredient;

    public CERecipeIngredient() {
    }

    //kategoriler enum olarak buradan setlenebilir.
}
