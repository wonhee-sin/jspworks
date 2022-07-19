package com.bean;

import java.io.Serializable;

public class Calculator implements Serializable {
	private static final long serialVersionUID = 12345L;
	
	//field
	private int num1 = 0;
	private int num2 = 0;
	private String op = "";
	private int result = 0;
	
	//계산 메소드
	public int calculate() {
		switch(op) {
			case "+" :
				result = num1 + num2;
				break;
			case "-" :
				result = num1 - num2;
				break;
			case "*" :
				result = num1 * num2;
				break;
			case "/" :
				result = (int)((double)num1 / (double)num2);
				break;
		}
		
		return result;
	}

	public int getNum1() {
		return num1;
	}

	public void setNum1(int num1) {
		this.num1 = num1;
	}

	public int getNum2() {
		return num2;
	}

	public void setNum2(int num2) {
		this.num2 = num2;
	}

	public String getOp() {
		return op;
	}

	public void setOp(String op) {
		this.op = op;
	}
	
	public int getResult() {
		return result;
	}
	
}
