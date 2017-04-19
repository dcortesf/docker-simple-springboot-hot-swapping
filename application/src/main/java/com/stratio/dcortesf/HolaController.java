package com.stratio.dcortesf;

import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HolaController{

	@RequestMapping(value="/hola/{nombre}",method=RequestMethod.GET, produces=MediaType.APPLICATION_JSON_VALUE)
    public String hola(@PathVariable String nombre) {
	
    	return "hola "+nombre+" !";
    }
 }