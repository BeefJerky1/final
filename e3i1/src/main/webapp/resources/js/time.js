const dateformat = {
	SimpleDateTimeFormat: function(date, pattern) {
		var days = ["일", "월", "화", "수", "목", "금", "토"];
		var dateString = pattern.replace(/(yyyy|MM|M|dd|d|HH|H|hh|h|mm|m|ss|s|SSS|a|EEE|eee)/g, function(match) {
			var matchString = "";
			switch(match) {
				case "yyyy":
					matchString = date.getFullYear();
					break;
				case "MM":
				case "M":
					matchString = date.getMonth() + 1;
					break;
				case "dd":
				case "d":
					matchString = date.getDate();
					break;
				case "HH":
				case "H":
					matchString = date.getHours();
					break;
				case "hh":
				case "h":
					var hours = date.getHours() % 12;
					matchString = (hours) ? hours : 12;
					break;
				case "mm":
				case "m":
					matchString = date.getMinutes();
					break;
				case "ss":
				case "s":
					matchString = date.getSeconds();
					break;
				case "SSS":
					matchString = date.getMilliseconds();
					break;
				case "a":
					matchString = (date.getHours() < 12) ? "오전" : "오후";
					break;
				case "EEE":
					matchString = days[date.getDay()] + "요일";
					break;
				case "eee":
					matchString = days[date.getDay()];
					break;
				default :
					matchString = match;
					break;
			}
			if (match == "SSS") {
				if (matchString < 10) {
					matchString = "00" + matchString;
				} else if (matchString < 100) {
					matchString = "0" + matchString;
				}
			} else {
				if (match != "M" && match != "d" && match != "H" && match != "h" && match != "m" && match != "s"
					&& match != "a" && match != "EEE" && match != "eee") {
					if ((typeof(matchString) == "number" && matchString < 10)) {
						matchString = "0" + matchString;
					}
				}
			}
			return matchString;
		});
	
		return dateString;
	},
	elapsedText: function(date) {
		// 초 (밀리초)
		const seconds = 1;
		// 분
		const minute = seconds * 60;
		// 시
		const hour = minute * 60;
		// 일
		const day = hour * 24;
		
		var today = new Date();
		var elapsedTime = Math.trunc((today.getTime() - date.getTime()) / 1000);
		
		var elapsedText = "";
		if (elapsedTime < (seconds + 10)) {
			elapsedText = "방금 전";
		} else if (elapsedTime < minute) {
			elapsedText = elapsedTime + "초 전";
		} else if (elapsedTime < hour) {
			elapsedText = Math.trunc(elapsedTime / minute) + "분 전";
		} else if (elapsedTime < day) {
			elapsedText = Math.trunc(elapsedTime / hour) + "시간 전";
		} else if (elapsedTime < (day * 15)) {
			elapsedText = Math.trunc(elapsedTime / day) + "일 전";
		} else {
			elapsedText = this.SimpleDateTimeFormat(date, "yyyy.M.d");
		}
		
		return elapsedText;
	}
};