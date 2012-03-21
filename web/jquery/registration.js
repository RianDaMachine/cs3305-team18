
 /* Author : Liz Hayes
 */

		function new_aso() {
			var aso;
			try {// Firefox, Opera 8.0+, Safari
			   aso=new XMLHttpRequest();
			} catch (e) {// Internet Explorer
				try {
					aso=new ActiveXObject("Msxml2.XMLHTTP");
				} catch (e) {
					try {
						aso=new ActiveXObject("Microsoft.XMLHTTP");
					}
					catch (e) {
						alert("Your browser does not support AJAX!");
					}
				}
			}
			return aso;
		}

                
			$(function(){
				// Accordion
				$("#accordion").accordion({ autoHeight: false, header: "h3", });

				//hover states on the static widgets
				$('#dialog_link, ul#icons li').hover(
					function() { $(this).addClass('ui-state-hover'); },
					function() { $(this).removeClass('ui-state-hover'); }
				);
			});

