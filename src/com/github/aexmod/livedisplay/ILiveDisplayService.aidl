package com.github.aexmod.livedisplay;


import com.github.aexmod.livedisplay.HSIC;
import com.github.aexmod.livedisplay.LiveDisplayConfig;

interface ILiveDisplayService {
    LiveDisplayConfig getConfig();

    int getMode();
    boolean setMode(int mode);

    float[] getColorAdjustment();
    boolean setColorAdjustment(in float[] adj);

    boolean isAutoContrastEnabled();
    boolean setAutoContrastEnabled(boolean enabled);

    boolean isCABCEnabled();
    boolean setCABCEnabled(boolean enabled);

    boolean isColorEnhancementEnabled();
    boolean setColorEnhancementEnabled(boolean enabled);

    int getDayColorTemperature();
    boolean setDayColorTemperature(int temperature);

    int getNightColorTemperature();
    boolean setNightColorTemperature(int temperature);

    int getColorTemperature();

    boolean isAutomaticOutdoorModeEnabled();
    boolean setAutomaticOutdoorModeEnabled(boolean enabled);

    HSIC getPictureAdjustment();
    HSIC getDefaultPictureAdjustment();
    boolean setPictureAdjustment(in HSIC adj);
    boolean isNight();
}