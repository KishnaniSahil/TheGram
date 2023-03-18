package com.theGram.socialmedia.service;


import com.theGram.socialmedia.repository.profilepageRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class profilepageService {
    @Autowired
 private profilepageRepository profilepageRepository;
    public Map<String, Object> getProfileData(int userID){
        return this.profilepageRepository.getProfileData(userID);
    }
    public void registerUser(Map<String,Object> userData){
        String firstName=(String)userData.get("firstName");
        String lastName=(String)userData.get("lastName");
        String gender=(String)userData.get("gender");
        String userName=(String)userData.get("userName");
        String pw=(String)userData.get("password");
        Integer mobileNo=(Integer)userData.get("mobileNo");
        String email=(String)userData.get("email");
        String bio=(String)userData.get("bio");

        this.profilepageRepository.registerUser(firstName,lastName,gender,userName, pw,mobileNo,email,
               bio);
    }
    public Map<String, Object> deleteUser(int userID){
        return this.profilepageRepository.deleteUser(userID);
    }

}

