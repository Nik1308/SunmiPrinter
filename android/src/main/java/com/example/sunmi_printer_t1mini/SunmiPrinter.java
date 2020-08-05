package com.example.sunmi_printer_t1mini;

import android.content.Context;
import android.util.Log;

import com.example.sunmi_printer_t1mini.utils.Aidl;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;


public class SunmiPrinter{

  public void initAidl(Context context) {
    Aidl.getInstance().binding(context);
    Aidl.getInstance().initPrinter();
  }

  public void text(String text){
    Aidl.getInstance().printText(text);
  }

}