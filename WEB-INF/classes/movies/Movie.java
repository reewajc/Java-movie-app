package movies;
import java.io.Serializable;

/*
Author: Ram and Jonathan
Date: 09/30/2021
Description: Assignment week 8 - Movie class for Java bean
Company: Bellevue
*/

public class Movie implements Serializable  {
	private int id;
	private String title;
	private String year;
	private String actor;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getActor() {
		return actor;
	}
	public void setActor(String actor) {
		this.actor = actor;
	}


}
