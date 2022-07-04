class Slider {
  String image;
  String type;
  int id;
  dynamic value;

  Slider(this.image, this.type, this.id, this.value);

  factory Slider.fromJson(Map<String, dynamic> json) {
    dynamic value = null;
    switch (json['type']) {
      case 'FORM':
        value = json['form'];
        break;
      case 'LINK':
        value = json['link'];
        break;
      case 'OFFER':
        value = json['sale'];
        break;
    }
    return Slider(json['image'], json['type'], json['id'], value);
  }
}
