
/* ****************************************************************************

 * eID Middleware Project.
 * Copyright (C) 2008-2010 FedICT.
 *
 * This is free software; you can redistribute it and/or modify it
 * under the terms of the GNU Lesser General Public License version
 * 3.0 as published by the Free Software Foundation.
 *
 * This software is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this software; if not, see
 * http://www.gnu.org/licenses/.

**************************************************************************** */
#pragma once

//#include "pkcs15.h"
//#include "pinpad.h"
#include "common/hash.h"
#include "card.h"

namespace eIDMW
{

	class CCardLayer;

	class CReader
	{
public:
		~CReader(void);

	/** Returns the reader name */
		std::string & GetReaderName();

	/** Returns true is ulState indicates that a card is present, false otherwise. */
		static bool CardPresent(unsigned long ulState);

		CCard* GetCard(void);

	/**
	 * Get the status w.r.t. a card being present in the reader
	 * \retval #CARD_INSERTED      a card has been inserted
	 * \retval #CARD_NOT_PRESENT   no card is present
	 * \retval #CARD_STILL_PRESENT the card we connected to is stil present
	 * \retval #CARD_REMOVED       the card has been removed
	 * \retval #CARD_OTHER         the card has been removed and replace by (another) one,
	 *             this can only be returned if bReconnect = true
	 * \retval #CARD_UNKNOWN_STATE we were unable to determine card status (e.g., because the slot is in use by another process)
	 *
	 * If the card has been removed and a (new) card has been inserted
	 * then if bReconnect is true, this function will reconnect to the (new) card.
	 */
		tCardStatus Status(bool bReconnect = false, bool bPresenceOnly = false);

	/**
	 * Connect to the card; it's save to call this function multiple times.
	 * Returns true if successfully connected, false otherwise (in which case
	 * no card or an unresponsive card is present).
	 * NOTE: this method must be called successfully before calling
	 * any of the other functions below.
	 */
		bool Connect();

	/** Disconnect from the card; it's safe to call this function multiple times */
		void Disconnect(tDisconnectMode disconnectMode = DISCONNECT_LEAVE_CARD);

private:
		CReader(const std::string & csReader, CContext * poContext);
		// No copies allowed
		CReader(const CReader & oReader);
		CReader & operator =(const CReader & oReader);

#ifdef WIN32
#pragma warning(push)
#pragma warning(disable:4251)	// these strings do not need a dll interface
#endif
		std::string m_csReader;
		std::wstring m_wsReader;
#ifdef WIN32
#pragma warning(pop)
#endif

		CCard *m_poCard;
		CPinpad m_oPinpad;

		friend class CCardLayer;	// calls the CReader constructor

		CContext *m_poContext;
	};

}
