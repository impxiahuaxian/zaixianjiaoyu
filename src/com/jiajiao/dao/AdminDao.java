package com.jiajiao.dao;

import com.jiajiao.bean.Admin;

public interface AdminDao {

	public Admin getByUsernameAndPwd(String username, String password);
}
