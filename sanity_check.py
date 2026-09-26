
sample_bookings = [
    {"booking_id": "B0005", "category": "AC Repair & Service", "amount_inr": 1316},
    {"booking_id": "B0019", "category": "AC Repair & Service", "amount_inr": 538},
    {"booking_id": "B0027", "category": "AC Repair & Service", "amount_inr": 1016},
    {"booking_id": "B0055", "category": "AC Repair & Service", "amount_inr": 1505},

    {"booking_id": "B0001", "category": "Plumbing", "amount_inr": 1369},
    {"booking_id": "B0003", "category": "Plumbing", "amount_inr": 772},
    {"booking_id": "B0004", "category": "Plumbing", "amount_inr": 1133},
    {"booking_id": "B0006", "category": "Plumbing", "amount_inr": 805},

    {"booking_id": "B0018", "category": "Salon for Men", "amount_inr": 1414},
    {"booking_id": "B0024", "category": "Salon for Men", "amount_inr": 1176},
    {"booking_id": "B0029", "category": "Salon for Men", "amount_inr": 858},
    {"booking_id": "B0032", "category": "Salon for Men", "amount_inr": 638},
]

category_summary = {}

for booking in sample_bookings:
    category = booking["category"]
    amount = booking["amount_inr"]

    if category not in category_summary:
        category_summary[category] = {
            "count": 0,
            "total": 0
        }

    category_summary[category]["count"] = (
        category_summary[category]["count"] + 1
    )

    category_summary[category]["total"] = (
        category_summary[category]["total"] + amount
    )

for category in category_summary:
    count = category_summary[category]["count"]
    total = category_summary[category]["total"]

    print(
        category,
        "- Count:",
        count,
        "- Total:",
        total
    )

# SQL cross-check result matches the Python result exactly
# for AC Repair & Service, Plumbing and Salon for Men.
