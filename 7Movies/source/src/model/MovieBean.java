/*
MovieBean
Classe usata per rappresentare i film
*/

package model;

import java.text.DecimalFormat;
import java.util.ArrayList;

public class MovieBean {
	
	private long id;
	private String title;
	private String director;
	private String year;
	private String langs; 
	private float price;
	private String categories;
	private String imgpath;
	private String framepath;
	private String description;
	
	public void setId (long id) { this.id = id; }
	public void setTitle (String title) { this.title = title; }
	public void setDirector (String director) { this.director = director; }
	public void setYear (String year) { this.year = year; }
	public void setLangs (String langs) { this.langs = langs; }
	public void setPrice (float price) { this.price = price; }
	public void setCategories (String categories) { this.categories = categories; }
	public void setImgpath (String path) { this.imgpath = path;	}
	public void setFramepath (String path) { this.framepath = path;	}
	public void setDescription (String description) {this.description = description;}
	
	public long getId() {return this.id;}
	public String getTitle() {return this.title;}
	public String getDirector() {return this.director;}
	public String getYear() {return this.year;}
	public String getLangs (){return this.langs;}
	public float getPrice() {return this.price;}
	public String getCategories() {return this.categories;}
	public String getImgpath () { return this.imgpath; }
	public String getFramepath () { return this.framepath; }
	public String getDescription () { return this.description; }
	public String getDescriptionAbbv () { 
		if(this.description != null && this.description.length() >= 30)
			return this.description.substring(0, 30).concat("..."); 
		else return null;
	}
	
	public static String getIdString (ArrayList<MovieBean> list) {
		String sCart = "";
		if(list == null) {
			return sCart;
		}
		for(MovieBean mb : list) {
			sCart += mb.getId() + ",";
		}
		return sCart;
	}
	
	public static String getTotal (ArrayList<MovieBean> list) {
		float tot = 0;
		for(MovieBean mov : list) {
			tot += mov.getPrice();
		}
		DecimalFormat df = new DecimalFormat("###.##");
		return df.format(tot);
	}
	
	public boolean equals (MovieBean mb) {
		return (this.id == mb.getId()); 
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + (int) (id ^ (id >>> 32));
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		MovieBean other = (MovieBean) obj;
		if (id != other.id)
			return false;
		return true;
	}
	
}
