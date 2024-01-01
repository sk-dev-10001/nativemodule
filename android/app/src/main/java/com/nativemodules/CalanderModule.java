package com.nativemodules;

import android.util.Log;

import androidx.annotation.NonNull;

import com.facebook.react.bridge.Callback;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;

public class CalanderModule extends ReactContextBaseJavaModule {
    CalanderModule(ReactApplicationContext context){
        super(context);
    }

    @NonNull
    @Override
    public String getName() {
        return "CalanderModule";
    }
    @ReactMethod()
    public void createCalendarEvent(String name, String location, Callback callBack){
        Log.d("CalendarModule", "Create event called with name: " + name
                + " and location: " + location);
        Integer eventId = 888888;
        callBack.invoke(eventId);
    }
}
