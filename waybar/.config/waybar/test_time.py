import datetime

now = datetime.datetime.now()

# Test basic hour format
formatted_hour = now.strftime("%H")
print(f"Python strftime '%H': {formatted_hour}")

# Test full time format
formatted_time = now.strftime("%Y-%m-%d %H:%M:%S")
print(f"Python strftime '%Y-%m-%d %H:%M:%S': {formatted_time}")
