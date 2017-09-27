jQuery( function( ) {
	var $formAction = function( ) {
		var $self = jQuery( this ) ;
		var $failure = function( ) {
			var $error = $self.find( ".error" ).removeClass( "nod" ) ;
			setTimeout( function( ) {
				$error.addClass( "nod" ) ;
			} , 5e3 ) ;
		} ;

		jQuery.ajax( {
			"url" : $self.attr( "action" ) ,
			"type" : $self.attr( "method" ) ,
			"data" : $self.serialize( ) ,
			"dataType" : "json" ,
			"context" : $self ,
			"success" : function( $data ) {
				if ( ! $data || ! ( "data" in $data ) || ! $data.data ) {
					return $failure.call( this ) ;
				}

				return $initInterface.call( $data ) ;	
			} ,
			"failure" : $failure
		} ) ;

		return false ;
	} ;

	var $formUser = jQuery( ".form-user" ) ;
	var $formWithdrawal = jQuery( ".form-withdrawal" ).on( "submit" , $formAction ) ;
	var $formAccount = jQuery( ".form-account" ) ;
	var $formFund = jQuery( ".form-fund" ).on( "submit" , $formAction ) ;
	var $formAccountHistory = jQuery( ".form-account-history" ) ;
	var $formAuth = jQuery( ".form-auth" ).on( "submit" , $formAction ) ;

	var $formAccountHistoryList = $formAccountHistory.find( ".form-account-history-list" ) ;
	var $formAccountHistoryListItem = $formAccountHistoryList.find( "li.nod" ).clone( true ) ;

	var $initInterface = function( ) {
		$formUser.find( ".form-user-login" ).text( this.data.user.login ) ;
		$formUser.find( ".form-user-created" ).text( this.data.user.created ) ;

		$formFund.find( "input[name=session_id]" ).val( this.data.session_id ) ;
		$formWithdrawal.find( "input[name=session_id]" ).val( this.data.session_id ) ;

		$formAccount.find( ".form-account-account_id" ).text( this.data.account.id ) ;
		$formAccount.find( ".form-account-created" ).text( this.data.account.created ) ;
		$formAccount.find( ".form-account-amount" ).text( this.data.account.amount ) ;

		$formAccountHistoryList.empty( ) ;
		jQuery( this.data.account_history ).each( function( ) {
			var $itemCurrent = $formAccountHistoryListItem.clone( true ) ;
			var $className = "account_history-" ;
			switch ( this.array ) {
				case "0" : {
					$className += "debet" ;

					break ;
				}
				case "1" : {
					$className += "credit" ;

					break ;
				}
				default : {
					return true ;
				}
			}
			$itemCurrent.removeClass( "nod" ).addClass( $className ) ;
			$itemCurrent.find( ".form-account-history-id" ).text( this.id ) ;
			$itemCurrent.find( ".form-account-history-datetime" ).text( this.created ) ;
			$itemCurrent.find( ".form-account-history-amount" ).text( this.amount ) ;
			$formAccountHistoryList.append( $itemCurrent ) ;

			return true ;
		} ) ;
		$formAccountHistoryList.append( $formAccountHistoryListItem ) ;

		$formAuth.addClass( "nod" ) ;
		$formWithdrawal.removeClass( "nod" ) ;
		$formAccount.removeClass( "nod" ) ;
		$formFund.removeClass( "nod" ) ;
		$formAccountHistory.removeClass( "nod" ) ;
		$formUser.removeClass( "nod" ) ;
	} ;
} ) ;