package com.accenture.Garcia.Hernan.ChickenTest.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;


@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter{
	
	@Autowired	
	UserDetailsService userDetailsService;
	
	@Autowired
	public void configAuthentication(AuthenticationManagerBuilder auth) throws Exception {			 
	 auth.userDetailsService(userDetailsService).passwordEncoder(passwordencoder());;
		
	}	

	
	@Override
    protected void configure(HttpSecurity http) throws Exception {
        http
            .authorizeRequests()
        		.antMatchers("/resources/**").permitAll()
            	.antMatchers("/register").permitAll()
            	.antMatchers("/checkUser").permitAll()
            	.antMatchers("/login**").permitAll()
            	.antMatchers("/Users/**").hasAuthority("Admin")
                .anyRequest().authenticated()
               	.and()
             .formLogin()
                .loginPage("/login")
                .permitAll()
                .and()
            .logout()
            	.permitAll();
    }
	
	@Bean(name="passwordEncoder")
    public PasswordEncoder passwordencoder(){
    	return new BCryptPasswordEncoder();
    }
}
