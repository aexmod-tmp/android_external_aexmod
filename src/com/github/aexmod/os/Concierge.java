package com.github.aexmod.os;

import android.os.Parcel;

public final class Concierge {

    private Concierge() {
        // Don't instantiate
    }

    public static final int PARCELABLE_VERSION = 9;

    public static ParcelInfo receiveParcel(Parcel parcel) {
        return new ParcelInfo(parcel);
    }

    public static ParcelInfo prepareParcel(Parcel parcel) {
        return new ParcelInfo(parcel, PARCELABLE_VERSION);
    }

    public final static class ParcelInfo {
        private Parcel mParcel;
        private int mParcelableVersion;
        private int mParcelableSize;
        private int mStartPosition;
        private int mSizePosition;
        private boolean mCreation = false;

        ParcelInfo(Parcel parcel) {
            mCreation = false;
            mParcel = parcel;
            mParcelableVersion = parcel.readInt();
            mParcelableSize = parcel.readInt();
            mStartPosition = parcel.dataPosition();
        }

        ParcelInfo(Parcel parcel, int parcelableVersion) {
            mCreation = true;
            mParcel = parcel;
            mParcelableVersion = parcelableVersion;

            mParcel.writeInt(mParcelableVersion);

            mSizePosition = parcel.dataPosition();
            mParcel.writeInt(0);
            mStartPosition = parcel.dataPosition();
        }

        public int getParcelVersion() {
            return mParcelableVersion;
        }

        public void complete() {
            if (mCreation) {
                // Go back and write size
                mParcelableSize = mParcel.dataPosition() - mStartPosition;
                mParcel.setDataPosition(mSizePosition);
                mParcel.writeInt(mParcelableSize);
                mParcel.setDataPosition(mStartPosition + mParcelableSize);
            } else {
                mParcel.setDataPosition(mStartPosition + mParcelableSize);
            }
        }
    }
}