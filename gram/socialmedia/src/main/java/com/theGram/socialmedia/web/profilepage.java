package com.theGram.socialmedia.web;

import com.theGram.socialmedia.service.profilepageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@CrossOrigin(
        origins = {"http://localhost:4200"}
)
@RestController
@RequestMapping({"/api"})

public class profilepage {
    @Autowired
    private profilepageService profilepage;
    @GetMapping({"/profile/{userID}"})
    public Map<String, Object> getProfileData(@PathVariable int userID) {
        return this.profilepage.getProfileData(userID);
    }
    @PostMapping("/register")
    public void registerUser(@RequestBody Map<String,Object> userData){
        this.profilepage.registerUser(userData);
    }
    @GetMapping({"/user/{userID}"})
    public Map<String, Object> deleteUser(@PathVariable int userID) {
        return this.profilepage.deleteUser(userID);
    }


}
