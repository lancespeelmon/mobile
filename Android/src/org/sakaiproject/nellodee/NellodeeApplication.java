package org.sakaiproject.nellodee;

import org.apache.http.client.CookieStore;
import org.apache.http.impl.client.BasicCookieStore;
import org.sakaiproject.nellodee.user.AboutMe;
import org.sakaiproject.nellodee.user.BasicProfile;


import android.app.Application;
import android.content.Context;
import android.content.SharedPreferences;

public class NellodeeApplication extends Application {

	private static final String PREFS_NAME = "SakaiPrefs";
	private CookieStore cookies;
	private BasicProfile basic;
	private AboutMe	about;
	private DataController data;
	
	public NellodeeApplication() {
		this.cookies = new BasicCookieStore();
		this.basic = new BasicProfile();
		this.about = new AboutMe();
		this.data = new DataController();
	}

	/*	GETTERS AND SETTERS */
	public CookieStore getCookies() {
		return cookies;
	}
	public void setCookies(CookieStore cookies) {
		this.cookies = cookies;
	}
	public static String getPrefsName() {
		return PREFS_NAME;
	}
	public BasicProfile getBasic() {
		return basic;
	}
	public void setBasic(BasicProfile basic) {
		this.basic = basic;
	}
	public AboutMe getAbout() {
		return about;
	}
	public void setAbout(AboutMe about) {
		this.about = about;
	}
	public DataController getData() {
		return data;
	}

	public void setData(DataController data) {
		this.data = data;
	}

	/* MANAGE PREFERENCES */
	public boolean isFirstTime(Context context) {
		return context.getSharedPreferences(getPrefsName(),MODE_PRIVATE).getBoolean("first", true);
    }

	public boolean isSavedUser(Context context) {
		return context.getSharedPreferences(getPrefsName(),MODE_PRIVATE).getBoolean("savedUser", false);
    }
	
	public String getURL(Context context) {
		return context.getSharedPreferences(getPrefsName(),MODE_PRIVATE).getString("url", "");
    }


}
