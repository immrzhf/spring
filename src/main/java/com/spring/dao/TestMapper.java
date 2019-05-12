package com.spring.dao;

import com.spring.model.Test;

import java.util.List;
import java.util.Map;

public interface TestMapper {

    Test selectByPrimaryKey(String id);

    List<Map<String, Object>> getGoodsList();
}
