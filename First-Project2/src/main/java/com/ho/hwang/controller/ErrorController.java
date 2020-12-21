package com.ho.hwang.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import java.util.NoSuchElementException;

@Controller
@ControllerAdvice
@Slf4j
public class ErrorController  {

    @ExceptionHandler
    public String noSearchData(NoSuchElementException ex){
        log.info(ex.getClass().getName());
        log.warn("error", ex);
        return "noData";
    }
}
