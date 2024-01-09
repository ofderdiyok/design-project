package com.example.MarketApp.business.base.controller;

import com.example.MarketApp.business.base.entity.BaseEntity;
import com.example.MarketApp.business.base.service.BaseService;

public abstract class BaseController<E extends BaseEntity> {
    public abstract BaseService<E> getService();

    public abstract String getName();
}
