
#!/bin/bash

#brief about project rational
echo 

echo "Welcome to Bluesea Real Estate"
#list properties
#register clients
#rent property


#property listing

function property() {
	echo "Please register your property with us:"
	echo "_____________________________________________________"
	echo "Name of Landlord:"
	read landlord_name
	echo "Property name:"
	read property_name
	echo "Property rent amount:"
	read property_amount
	echo "Landlord phone:"
	read landlord_phone
	echo "$property_name               $property_amount               $landlord_name" >> property_list.txt
	echo "------------------------------------------------------"
	echo "Thank you for registering your property with us."
	echo "______________________________________________________"
}

#landlord registration
function landlord() {
	echo "Below are the landlord's details:"
	echo -e "Name: $landlord_name\nProperty: $property_name\nPhone: $landlord_phone"
	echo -e "$landlord_name               $property_name               $landlord_phone" >> landlord1.txt
	echo  "_______________________________________________________"
}

#tenant registration
function tenant() {
	echo "Please register as a tenant"

	echo "Welcome tenant, pls fill the form below:"
	echo "Name:"
	read client_name
	echo "Phone Number"
	read client_phone
	echo "_____________________________________________________"
}

function property_list() {
	echo "Full list of our properties:"
	cat property_list.txt
	echo "____________________________________________________"
}

#function has not been used
function select_property() {
	echo "Kindly type your property details."
	read property_address
	my_property=grep $property_address property_list.txt
	return $my_property
}

#renting a property
function rent() {
	echo "Renting a property..."
	echo "Find the list of properties below:"
	echo "____________________________________________________"
	cat property_list.txt
	echo "____________________________________________________"
	echo "Client Name:"
	read client_name
	echo "Type property address"
	read property_add
	echo "Type rent amount:"
	read rent_amount
	echo "___________________________________________________"
	echo "Are you ready to pay, (y/n)?"
	read answer

	if [ ${answer,,} == "y" ]; then
		echo "Thank you for renting with us."
		echo -e "Your property details are:\nProperty Address: $property_add\nAmount Paid: $rent_amount\nYour name: $client_name"
		echo "________________________________________________"
		echo "Rent Summary:"
		echo -e "$client_name               $property_add               $rent_amount              $landlord_name" >> clients.txt
		echo "_______________________________________________"
	else
		echo "Sorry you are not renting. We hope to see you again."

	fi
	echo "_______________________________________________________"
}

while true; do
	echo "Please choose your service option:"
	echo "1. Register your property"
	echo "2. Register as a tenant"
	echo "3. Rent"
	echo "4. Landlord details:"
	echo "5. List available properties:"
	echo "6. Exit"
	echo "_______________________________________________________"
	read option

	case $option in
		1) property;;
		2) tenant;;
		3) rent;;
		4) landlord ;;
		5) property_list ;;
		6) echo "Logging out...Thank you."
			break ;;
		*) echo "invalid option" ;;
	esac
done
