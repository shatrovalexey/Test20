jQuery( function( ) {
	var $formUser = jQuery( ".form-user" ) ;
	var $formAccount = jQuery( ".form-account" ) ;
	var $formAccountHistory = jQuery( ".form-account-history" ) ;
	var $formAuth = jQuery( ".form-auth" ).on( "submit" , function( ) {
		var $self = jQuery( this ) ;
		var $failure = function( ) {
			jQuery( ".form-auth-error" ).show( ).hide( 10e3 ) ;
		} ;

		jQuery.ajax( {
			"url" : $self.attr( "action" ) ,
			"type" : $self.attr( "method" ) ,
			"data" : $self.serialize( ) ,
			"dataType" : "json" ,
			"success" : function( $data ) {
				if ( ! $data || ! ( "data" in $data ) || ( $data.data.length != 32 ) ) {
					$failure.call( this ) ;
				}

				$initInterface.call( $data ) ;			
			} ,
			"failure" : function( ) {
				$failure.call( this ) ;
			}
		} ) ;

		return false ;
	} ) ;

	var $initInterface = function( ) {
		$formUser.find( ".form-user-login" ).text( this.data.user.login ) ;
		$formUser.find( ".form-user-created" ).text( this.data.user.created ) ;

		$formAccount.find( "input[name=session_id]" ).val( this.data.session_id ) ;
		$formAccount.find( ".form-account-account_id" ).text( this.data.account.id ) ;
		$formAccount.find( ".form-account-created" ).text( this.data.account.created ) ;
		$formAccount.find( ".form-account-amount" ).text( this.data.account.amount ) ;

		var $list = $formAccountHistory.find( ".form-account-history-list" ) ;
		var $item = $list.find( "li.nod" ).clone( true ) ;

		$list.empty( ) ;
		jQuery( this.data.account_history ).each( function( $i ) {
			var $itemCurrent = $item.clone( true ) ;
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
			$list.append( $itemCurrent ) ;

			return true ;
		} ) ;
		$list.append( $item ) ;

		$formAuth.addClass( "nod" ) ;
		$formAccount.removeClass( "nod" ) ;
		$formAccountHistory.removeClass( "nod" ) ;
		$formUser.removeClass( "nod" ) ;
	} ;
} ) ;