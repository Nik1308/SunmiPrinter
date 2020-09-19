package com.example.sunmi_printer_t1mini.utils;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.graphics.Bitmap;
import android.os.IBinder;
import android.os.RemoteException;
import android.widget.Toast;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import woyou.aidlservice.jiuiv5.ICallback;
import woyou.aidlservice.jiuiv5.IWoyouService;

public class Aidl{

    private static final String SERVICE＿PACKAGE = "woyou.aidlservice.jiuiv5";
    private static final String SERVICE＿ACTION = "woyou.aidlservice.jiuiv5.IWoyouService";

    private IWoyouService woyouService;
    private static Aidl mAidl = new Aidl();
    private static final int LINE_BYTE_SIZE = 32;
    private Context context;

    private Aidl() {
    }

    public static Aidl getInstance() {
        return mAidl;
    }

    private ServiceConnection connService = new ServiceConnection() {
      @Override
      public void onServiceDisconnected(ComponentName name) {
      woyouService = null;
      }
      @Override
      public void onServiceConnected(ComponentName name, IBinder service) {
      woyouService = IWoyouService.Stub.asInterface(service);
    }
    };

    public void binding(Context context){
      this.context = context.getApplicationContext();
      Intent intent = new Intent();
      intent.setPackage(SERVICE＿PACKAGE);
      intent.setAction(SERVICE＿ACTION);
      context.getApplicationContext().startService(intent);
      context.getApplicationContext().bindService(intent, connService, Context.BIND_AUTO_CREATE);
    }

    public void initPrinter() {
      if (woyouService == null) {
          return;
      }

      try {
        woyouService.printerInit(null);
      } catch (RemoteException e) {
        e.printStackTrace();
      }
    }


    public void printText(String text, int align){
      if (woyouService == null) {
          return;
      }
      try {
        woyouService.setAlignment(align, null);
        woyouService.printText(text, null);
      } catch (RemoteException e) {
          e.printStackTrace();
      }
    }

    public void printTableItem(String[] text, int[] width, int[] align) {
      if (woyouService == null) {
          return;
      }
      try {
          woyouService.printColumnsString(text, width, align, null);
      } catch (RemoteException e) {
          e.printStackTrace();
      }
    }

    public void sendRawData(byte[] data) {
      if (woyouService == null) {
          return;
      }

      try {
          woyouService.sendRAWData(data, null);
      } catch (RemoteException e) {
          e.printStackTrace();
      }
    }

    public void setFontSize(int size) {
      try {
          woyouService.setFontSize(size, null);
      } catch (RemoteException e) {
          e.printStackTrace();
      }
    }

    public void lineWrap(int line) {
      try {
          woyouService.lineWrap(line, null);
      } catch (RemoteException e) {
          e.printStackTrace();
      }
    }

    public void sendLCDString(String text){
      try {
          woyouService.sendLCDString(text, null);
      } catch (RemoteException e) {
          e.printStackTrace();
      }
    }

    public void sendLCDDoubleString(String upperText,String bottomText){
      try {
          woyouService.sendLCDDoubleString(upperText,bottomText, null);
      } catch (RemoteException e) {
          e.printStackTrace();
      }
    }

    public int updatePrinterState(){
      try{
        int state =  woyouService.updatePrinterState();
        return state;
      } catch (RemoteException e) {
          
          e.printStackTrace();
          return 2000;
      }
    }

    public void printBitmap(Bitmap bitmap, int align) {
      if (woyouService == null) {
          return;
      }

      try {
          woyouService.setAlignment(align, null);
          woyouService.printBitmap(bitmap, null);
          woyouService.lineWrap(1, null);
      } catch (RemoteException e) {
          e.printStackTrace();
      }
    }
}