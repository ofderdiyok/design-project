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

        if (dto.getCategory() != null){
            predicates.add(criteriaBuilder.equal(recipeRoot.get("category"), dto.getCategory()));
        }

        if (dto.getMinCalories() != 0){
            predicates.add(criteriaBuilder.greaterThanOrEqualTo(recipeRoot.get("calories"), dto.getMinCalories()));
        }

        if (dto.getMaxCalories() != 0){
            predicates.add(criteriaBuilder.lessThanOrEqualTo(recipeRoot.get("calories"), dto.getMaxCalories()));
        }

        if (dto.getIngredientSelectImplDtoList() != null){

            List<Predicate> ingredientPredicates = new ArrayList<>();

            for (IngredientSelectImplDto ingredientDto : dto.getIngredientSelectImplDtoList()) {
                if (ingredientDto != null && ingredientDto.getId() != null) {
                    Predicate ingredientPredicate = recipeRoot.join("recipeIngredients")
                            .get("ingredient").get("id").in(ingredientDto.getId());

                    ingredientPredicates.add(ingredientPredicate);
                }
            }

            if (!ingredientPredicates.isEmpty()) {
                predicates.add(criteriaBuilder.and(ingredientPredicates.toArray(new Predicate[0])));
            }
        }

        criteriaQuery.where(
                criteriaBuilder.and(predicates.toArray(new Predicate[0]))
        );

        TypedQuery<Recipe> query = em.createQuery(criteriaQuery);

        return query.getResultList();
    }
}
