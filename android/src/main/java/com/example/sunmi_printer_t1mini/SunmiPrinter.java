package com.example.sunmi_printer_t1mini;

import android.content.Context;
import android.util.Log;

import com.example.sunmi_printer_t1mini.utils.Aidl;
import com.example.sunmi_printer_t1mini.utils.ESCUtil;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;


public class SunmiPrinter{

  public static int DEFAULT_FONT_SIZE = 24;

  public void initAidl(Context context) {
    Aidl.getInstance().binding(context);
    Aidl.getInstance().initPrinter();
  }

  public void boldOn() {
    Aidl.getInstance().sendRawData(ESCUtil.boldOn());
  }

  public void setFontSize(int size) {
    Aidl.getInstance().setFontSize(size);
  }

  public void boldOff() {
    Aidl.getInstance().sendRawData(ESCUtil.boldOff());
  }


  public void text(String text, int align, boolean bold,  int size){

    if (bold) {
      boldOn();
    }
    setFontSize(size);
    Aidl.getInstance().printTableItem(new String[] { text }, new int[] { 32 }, new int[] { align });
    // Aidl.getInstance().printText(text,align);

    setFontSize(DEFAULT_FONT_SIZE);

    // Reset styles
    if (bold) {
      boldOff();
    }

  }


}