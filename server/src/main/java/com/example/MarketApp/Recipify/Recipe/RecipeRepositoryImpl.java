package com.example.MarketApp.Recipify.Recipe;

import com.example.MarketApp.Recipify.Ingredient.Ingredient;
import com.example.MarketApp.Recipify.Ingredient.IngredientService;
import com.example.MarketApp.Recipify.Ingredient.dto.IngredientSelectImplDto;
import com.example.MarketApp.Recipify.Recipe.dto.RecipeSearchDto;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import jakarta.persistence.criteria.*;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.Set;
import java.util.stream.Collectors;

public class RecipeRepositoryImpl implements RecipeRepositoryCustom{

    private final EntityManager em;
    private final IngredientService ingredientService;

    public RecipeRepositoryImpl(EntityManager em, IngredientService ingredientService) {
        this.em = em;
        this.ingredientService = ingredientService;
    }

    @Transactional
    @Override
    public List<Recipe> findByExample(RecipeSearchDto dto) {
        CriteriaBuilder criteriaBuilder = em.getCriteriaBuilder();
        CriteriaQuery<Recipe> criteriaQuery = criteriaBuilder.createQuery(Recipe.class);
        List<Predicate> predicates = new ArrayList<>();

        Root<Recipe> recipeRoot = criteriaQuery.from(Recipe.class);

        if (dto.getName() != null){
            predicates.add(criteriaBuilder.equal(recipeRoot.get("name"), dto.getName()));
        }

        if (dto.getMinCalories() != 0){
            predicates.add(criteriaBuilder.greaterThanOrEqualTo(recipeRoot.get("calories"), dto.getMinCalories()));
        }

        if (dto.getMaxCalories() != 0){
            predicates.add(criteriaBuilder.lessThanOrEqualTo(recipeRoot.get("calories"), dto.getMaxCalories()));
        }

        if (dto.getIngredientSelectImplDtoList() != null){

            Set<Long> ingredientIds = dto.getIngredientSelectImplDtoList().stream()
                    .filter(Objects::nonNull)
                    .map(IngredientSelectImplDto::getId)
                    .collect(Collectors.toSet());



            predicates.add(recipeRoot.join("recipeIngredients").get("ingredient").get("id").in(ingredientIds));
        }

        criteriaQuery.where(
                criteriaBuilder.and(predicates.toArray(new Predicate[0]))
        );

        TypedQuery<Recipe> query = em.createQuery(criteriaQuery);
        int totalRows = query.getResultList().size();

        List<Recipe> result = query.getResultList();
        return result;
    }
}
