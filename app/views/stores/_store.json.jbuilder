json.extract! store, :id, :title, :sub_title, :icon, :tel_num, :landline,:show_landline, :address, :detail
json.url store_url(store, format: :json)
json.images store.store_images, :img_url
