#!/usr/bin/env python

import logging
import sys

PORT = sys.argv[1]
BAUDRATE = 115200
PIN = None

from gsmmodem.modem import GsmModem


def handleSms(sms):
    print("[{0}] {1}: {2}".format(sms.time, sms.number, sms.text))


def main():
    logging.basicConfig(format="%(levelname)s: %(message)s", level=logging.INFO)
    modem = GsmModem(PORT, BAUDRATE, smsReceivedCallbackFunc=handleSms)
    modem.smsTextMode = False
    modem.connect(PIN)
    try:
        if modem.ownNumber:
            print("Modem phone number:", modem.ownNumber)
        print("IMSI:", modem.imsi)
        print("IMEI:", modem.imei)
        modem.processStoredSms()
        while True:
            print(
                "--- Network: {0} / Signal: {1} ---".format(modem.networkName, modem.signalStrength)
            )
            modem.rxThread.join(60 * 60)
    finally:
        modem.close()


if __name__ == "__main__":
    main()
