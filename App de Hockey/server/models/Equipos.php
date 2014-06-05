<?php

/**
 * This is the model class for table "equipos".
 *
 * The followings are the available columns in table 'equipos':
 * @property integer $id
 * @property integer $fotoPortada
 * @property string $nombre
 * @property string $liga
 *
 * The followings are the available model relations:
 * @property Fotos $fotoPortada0
 * @property Goles[] $goles
 * @property Juegos[] $juegoses
 * @property Juegos[] $juegoses1
 * @property Jugadores[] $jugadores
 */
class Equipos extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @param string $className active record class name.
	 * @return Equipos the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}

	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'equipos';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('id, fotoPortada, nombre, liga', 'required'),
			array('id, fotoPortada', 'numerical', 'integerOnly'=>true),
			array('nombre', 'length', 'max'=>100),
			array('liga', 'length', 'max'=>10),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id, fotoPortada, nombre, liga', 'safe', 'on'=>'search'),
		);
	}

	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		// NOTE: you may need to adjust the relation name and the related
		// class name for the relations automatically generated below.
		return array(
			'logo' => array(self::BELONGS_TO, 'FotosApp', 'fotoPortada'),
			'goles' => array(self::HAS_MANY, 'Goles', 'idEquipo'),
			'juegosCasa' => array(self::HAS_MANY, 'Juegos', 'idEquipoCasa'),
			'juegosVisitante' => array(self::HAS_MANY, 'Juegos', 'idEquipoVisitante'),
			'jugadores' => array(self::HAS_MANY, 'Jugadores', 'idEquipo'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'fotoPortada' => 'Foto Portada',
			'nombre' => 'Nombre',
			'liga' => 'Liga',
		);
	}

	/**
	 * Retrieves a list of models based on the current search/filter conditions.
	 * @return CActiveDataProvider the data provider that can return the models based on the search/filter conditions.
	 */
	public function search()
	{
		// Warning: Please modify the following code to remove attributes that
		// should not be searched.

		$criteria=new CDbCriteria;

		$criteria->compare('id',$this->id);
		$criteria->compare('fotoPortada', $this->logo);
		$criteria->compare('nombre',$this->nombre,true);
		$criteria->compare('liga',$this->liga,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}
}