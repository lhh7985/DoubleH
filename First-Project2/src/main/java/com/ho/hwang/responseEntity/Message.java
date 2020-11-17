package com.ho.hwang.responseEntity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter
@Setter
@AllArgsConstructor
public class Message {
    private String message;
    private int code;
    private Object data;
}
