package com.sist.vo;

import lombok.Getter;
import lombok.Setter;

@Getter@Setter
public class RecipeVO {
   private int rno, hit, jjim, recommend;
   private String title,image,msg1,msg2,ingre,allSteps,allStepsImg,msg;
   
   private String people, time, level, ingre_title;

}