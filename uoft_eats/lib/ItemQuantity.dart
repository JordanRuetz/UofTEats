class ItemQuantity {
    String item;
    String size;
    int count;

    ItemQuantity(String item, String size, int count) {
        this.item = item;
        this.size = size;
        this.count = count;
    }

    String getSize() {
        return this.size;
    }

    String getItem() {
        return this.item;
    }

    int getCount() {
        return this.count;
    }

    void setCount(int count) {
        this.count = count;
    }

    void updateCount(int count) {
        this.count += count;
    }
}