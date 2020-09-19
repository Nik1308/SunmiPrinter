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

  public void emptyLines(int n) {
    Aidl.getInstance().lineWrap(n);
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

  public void row(String colsStr, boolean bold,int textSize){
    try{

      if (bold) {
        boldOn();
      }

      JSONArray cols = new JSONArray(colsStr);
      String[] colsText = new String[cols.length()];
      int[] colsWidth = new int[cols.length()];
      int[] colsAlign = new int[cols.length()];
      for (int i = 0; i < cols.length(); i++) {
        JSONObject col = cols.getJSONObject(i);
        String text = col.getString("text");
        int width = col.getInt("width");
        int align = col.getInt("align");
        colsText[i] = text;
        colsWidth[i] = width;
        colsAlign[i] = align;
      }

      // Print row
      setFontSize(textSize);
      Aidl.getInstance().printTableItem(colsText, colsWidth, colsAlign);

      setFontSize(DEFAULT_FONT_SIZE);

      // Reset styles
      if (bold) {
        boldOff();
      }

    }catch (Exception err) {
      Log.d("SunmiPrinter", err.getMessage());
    }
  }

  public void displayText(String text){
    Aidl.getInstance().sendLCDString(text);
  }

  public void displayDoubleText(String upperText,String bottomText){
    Aidl.getInstance().sendLCDDoubleString(upperText,bottomText);
  }

  public void printImage(String base64, int align) {
    byte[] bytes = Base64Utils.decode(base64);
    for (int i = 0; i < bytes.length; ++i) {
      // ajust data
      if (bytes[i] < 0) {
        bytes[i] += 256;
      }
    }
    AidlUtil.getInstance().printBitmap(BitmapUtil.convertToThumb(bytes, 280), align);
    // AidlUtil.getInstance().lineWrap(1);
  }


}