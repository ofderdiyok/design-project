package com.example.MarketApp.business.base.service;

import com.example.MarketApp.business.base.entity.BaseEntity;
import com.example.MarketApp.business.base.repository.BaseRepository;

public abstract class BaseService <E extends BaseEntity>{
    public abstract BaseRepository<E> getRepository();
}
