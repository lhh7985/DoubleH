package com.ho.hwang.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

import java.sql.Date;

public class SrDTO {

    @Getter
    @Setter
    @AllArgsConstructor
    public static class InsertSrDTO{
        private int customer_id;
        private int product_id;
        private int sr_type;
        private String type;
        private String customer_name;
        private String product_name;

        private String importance;
        private Date sr_requestDate;
        private String sr_title;
        private String sr_content;
        private String sr_registrant;
        private String sr_registrationDate;
    }

    @Getter
    @Setter
    @AllArgsConstructor
    public static class SelectSrDTO{
        private int sr_id;
        private String code_name;
        private String product_name;
        private String customer_name;
        private String sr_title;
        private Date sr_requestDate;
        private Date sr_estimatedDate;
        private Date sr_completionDate;
        private String sr_status;
        private String importance;
    }

    @Getter
    @Setter
    @AllArgsConstructor
    public static class SelectSrDetailDTO{
        private String code_name;
        private String product_name;
        private String customer_name;
        private String sr_title;
        private Date sr_requestDate;
        private Date sr_estimatedDate;
        private Date sr_completionDate;
        private String sr_status;
        private String importance;
        private String sr_content;
        private String sr_registrant;
        private Date sr_registrationDate;
    }

    @Getter
    @Setter
    @AllArgsConstructor
    public static class SelectSrListDTO{
        private int sr_id;
        private String code_name;
        private String product_name;
        private String customer_name;
        private String sr_title;
        private Date sr_requestDate;
        private String sr_status;
    }



}
