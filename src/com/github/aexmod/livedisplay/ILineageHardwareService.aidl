package com.github.aexmod.livedisplay;

import com.github.aexmod.livedisplay.DisplayMode;
import com.github.aexmod.livedisplay.HSIC;

interface ILineageHardwareService {

    int getSupportedFeatures();
    boolean get(int feature);
    boolean set(int feature, boolean enable);

    int[] getDisplayColorCalibration();
    boolean setDisplayColorCalibration(in int[] rgb);

    int getNumGammaControls();
    int[] getDisplayGammaCalibration(int idx);
    boolean setDisplayGammaCalibration(int idx, in int[] rgb);

    boolean requireAdaptiveBacklightForSunlightEnhancement();

    DisplayMode[] getDisplayModes();
    DisplayMode getCurrentDisplayMode();
    DisplayMode getDefaultDisplayMode();
    boolean setDisplayMode(in DisplayMode mode, boolean makeDefault);

    boolean isSunlightEnhancementSelfManaged();

    int getColorBalanceMin();
    int getColorBalanceMax();
    int getColorBalance();
    boolean setColorBalance(int value);

    HSIC getPictureAdjustment();
    HSIC getDefaultPictureAdjustment();
    boolean setPictureAdjustment(in HSIC hsic);
    float[] getPictureAdjustmentRanges();

    boolean setGrayscale(boolean state);
}