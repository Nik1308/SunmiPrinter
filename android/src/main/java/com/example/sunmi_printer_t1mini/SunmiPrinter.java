package com.example.sunmi_printer_t1mini;

import android.content.Context;
import android.util.Log;

import com.example.sunmi_printer_t1mini.utils.Aidl;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;


public class SunmiPrinter{

  public void initAidl(Context context) {
    AidlUtil.getInstance().binding(context);
    AidlUtil.getInstance().initPrinter();
  }

  public void text(String text){
    AidlUtil.getInstance().printText(text)
  }

}