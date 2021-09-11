/*
UserBean
Classe usata per rappresentare l'utente
*/
package model;

public class UserBean {
	private String name;
	private String surname;
	private String mail;
	private String cart;
	private Boolean admin;

	public UserBean() {
		
	}
	
	public UserBean(String name, String surname, String mail, String cart) {
		this.name = name;
		this.surname = surname;
		this.mail = mail;
		this.cart = cart;
	}
	
	public String getName() {
		return name;
	}
	
	public String getSurname() {
		return surname;
	}
	
	public String getMail() {
		return mail;
	}
	
	public String getCart(){
		if(this.cart != null) {
		return this.cart;
		}else return "";
	}
	
	public Boolean getAdmin () {
		return this.admin;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public void setSurname(String surname) {
		this.surname = surname;
	}
	
	public void setMail(String mail) {
		this.mail = mail;
	}
	
	public void setCart(String cart) {
		this.cart = cart;
		UserBeanDAO.updateCart(this);
	}
	
	public void setAdmin(Boolean admin) {
		this.admin = admin;
	}
}