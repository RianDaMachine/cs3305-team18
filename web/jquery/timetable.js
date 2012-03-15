/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

        $(function() {
		var where = $( "#where" ),
			when = $( "#when" ),
			attending = $( "#attending" ),
			allFields = $( [] ).add( where ).add( when ).add( attending );


		$( "#dialog-form" ).dialog({
			autoOpen: false,
			height: 440,
			width: 350,
			modal: true /*,
			buttons: {
				"Schedule!": function() {
					var bValid = true;
					allFields.removeClass( "ui-state-error" );

					if ( bValid ) {
                                                var meeting = where.val() + " " + when.val() + " " + attending.val();
						$( "#table tbody" ).append( "<tr>" +
							"<td class=\"selectrion\">" + meeting + "</td>" 
                                                        + "</tr>" );
                                                    
						$( this ).dialog( "close" );
					}
				},
				Cancel: function() {
					$( this ).dialog( "close" );
				}
			},
			close: function() {
				allFields.val( "" ).removeClass( "ui-state-error" );
			}*/
		});

		$("#formOption").dialog({
                        autoOpen: false,
			height: 100,
			width: 200,
			modal: true
                });
                
                $(".meeting").dialog({
                        autoOpen: false,
			height: 300,
			width: 350,
			modal: true 
                        
                        /*,
                         *
                         * Liz , I have commented this out to remove the buttons in the form.
                         *
                        buttons: {
                                        "Schedule!": function() {
                                                var bValid = true;

                                                if ( bValid ) {
                                                        $( "#users tbody" ).append( "<tr>" +
                                                                "<td>" + where.val() + "</td>" + 
                                                                "<td>" + when.val() + "</td>" + 
                                                                "<td>" + attending.val() + "</td>" +
                                                        "</tr>" ); 
                                                        $( this ).dialog( "close" );
                                                }
                                        },
                                        Cancel: function() {
                                                $( this ).dialog( "close" );
                                        }
                                },
                                
			close: function() {
				allFields.val( "" ).removeClass( "ui-state-error" );
			}*/
                })

		$( ".selection" ).click(function() {
                         
                             $( "#formOption" ).dialog( "open" );
                                       //dialog to pick between GROUP MEETING or ONLY ME 

                                    var selfClick = false;
                                    var groupClick = false;

                            $(".self").click(function(){	
    				selfClick = true;
    			
                                 if(selfClick){
                                      $( ".meeting" ).dialog( "open" ); 
                                 }
                            });

                            $(".groupForm").click(function(){
                                    groupClick = true;
    				
                                if(groupClick){
                                     $("#dialog-form").dialog("open");
                                 }
                            });				
			});
	});
