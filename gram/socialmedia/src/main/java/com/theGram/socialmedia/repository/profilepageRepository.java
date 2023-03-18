package com.theGram.socialmedia.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class profilepageRepository {
    @Autowired
    JdbcTemplate jdbcTemplate;

    public Map<String, Object> getProfileData(int userID) {
        return this.jdbcTemplate.queryForMap("EXEC theGram.sp_fetchUsers ?", userID);
    }

    public void registerUser(String firstName, String lastName, String gender, String userName, String pw, Integer mobileNo, String email, String bio) {
        this.jdbcTemplate.update("EXEC  theGram.sp_createUser ?,?,?,?,?,?,?,?", firstName, lastName, gender, userName, pw, mobileNo, email, bio);
    }
    public Map<String, Object> deleteUser(int userID) {
        return this.jdbcTemplate.queryForMap("EXEC theGram.sp_deleteuser ?", userID);
    }
}
