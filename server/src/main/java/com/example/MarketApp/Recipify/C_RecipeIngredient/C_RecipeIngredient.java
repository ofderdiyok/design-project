package com.example.MarketApp.Recipify.C_RecipeIngredient;

import com.example.MarketApp.Recipify.Ingredient.Ingredient;
import com.example.MarketApp.Recipify.Recipe.Recipe;
import jakarta.persistence.*;

@Entity
@Table(name = "c_recipeingredient")
public class C_RecipeIngredient {
    @Id
    @Column(name = "id", unique = true, nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(cascade = CascadeType.DETACH)
    @JoinColumn(name = "recipe_id")
    private Recipe recipe;

    @ManyToOne(cascade = CascadeType.DETACH)
    @JoinColumn(name = "ingredient_id")
    private Ingredient ingredient;

    public C_RecipeIngredient() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Recipe getRecipe() {
        return recipe;
    }

    public void setRecipe(Recipe recipe) {
        this.recipe = recipe;
    }

    public Ingredient getIngredient() {
        return ingredient;
    }

    public void setIngredient(Ingredient ingredient) {
        this.ingredient = ingredient;
    }
}
