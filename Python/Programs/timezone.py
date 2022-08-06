from datetime import datetime
import pytz

bogota_tz = pytz.timezone('America/Bogota')
bogota_date = datetime.now(bogota_tz)

print(bogota_date.strftime('%Y-%m-%d'))