/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pkg1;


public class Wallet {
	
	private int id;
	
	private Double cash;
	
	private int uid;
	
	public Wallet(){
		
	}

	public Wallet(int id, Double cash, int uid) {
		super();
		this.id = id;
		this.cash = cash;
		this.uid = uid;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Double getCash() {
		return cash;
	}

	public void setCash(Double cash) {
		this.cash = cash;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}
	
	

}
