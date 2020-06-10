def find_item_by_name_in_collection(search_item, collection)
  
  # Iterate through collection, and if the item_hash has the search item, return that item's hash
  collection.each do |item_hash|
    return item_hash if item_hash.has_value?(search_item)
  end
  
  # If iterated through entire collection but search item is not found, then return nil
  return nil
end


def consolidate_cart(unconsolidated_cart)
  result = []
  
  # Loop through each hash in unconsolidated_cart
  unconsolidated_cart.each do |unconsolidated_cart_item_hash|
    # Loop through each hash in result to see if there is a hash with the same item name as the current unconsolidated_cart_item_hash; if there is, add 1 to count
    hash_found = false
    
    result.each do |result_item_hash|
      if result_item_hash[:item] == unconsolidated_cart_item_hash[:item]
        result_item_hash[:count] += 1
        hash_found = true
      end
    end
    # If finished looping through result, but hash is not found, add unconsolidated_cart_item_hash into result, and add count key with val of 1
    if hash_found == false
      unconsolidated_cart_item_hash[:count] = 1
      result << unconsolidated_cart_item_hash
    end
  end
  
  result
end