package com.example.MarketApp.Recipify.Ingredient;

import com.example.MarketApp.Recipify.C_RecipeIngredient.C_RecipeIngredient;
import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;

import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "ingredient")
public class Ingredient{
    @Id
    @Column(name = "id", unique = true, nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "name")
    private String name;

    @JsonIgnore
    @OneToMany(mappedBy = "ingredient", fetch = FetchType.LAZY)
    private Set<C_RecipeIngredient> cRecipeIngredients = new HashSet<>();

    public Ingredient() {
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

    public Set<C_RecipeIngredient> getcRecipeIngredients() {
        return cRecipeIngredients;
    }

    public void setcRecipeIngredients(Set<C_RecipeIngredient> cRecipeIngredients) {
        this.cRecipeIngredients = cRecipeIngredients;
    }
}
