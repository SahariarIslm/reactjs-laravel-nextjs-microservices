<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use App\Models\OrderItem;

/**
 * @property int $id
 * @property string $first_name
 * @property string $last_name
 * @property string $email
 * @property \Illuminate\Support\Carbon|null $created_at
 * @property \Illuminate\Support\Carbon|null $updated_at
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Order newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Order newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Order query()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Order whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Order whereEmail($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Order whereFirstName($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Order whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Order whereLastName($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Order whereUpdatedAt($value)
 * @property-read mixed $total
 * @property-read \Illuminate\Database\Eloquent\Collection<int, OrderItem> $orderItems
 * @property-read int|null $order_items_count
 * @method static \Database\Factories\OrderFactory factory($count = null, $state = [])
 * @property-read mixed $name
 * @property string $code
 * @property int $user_id
 * @property string $influencer_email
 * @property string|null $address
 * @property string|null $address2
 * @property string|null $city
 * @property string|null $country
 * @property string|null $zip
 * @property int $complete
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Order whereAddress($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Order whereAddress2($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Order whereCity($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Order whereCode($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Order whereComplete($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Order whereCountry($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Order whereInfluencerEmail($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Order whereUserId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Order whereZip($value)
 * @property string|null $transection_id
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Order whereTransectionId($value)
 * @property-read mixed $admin_total
 * @property-read mixed $influencer_total
 * @mixin \Eloquent
 */
class Order extends Model
{
    use HasFactory;

    public function orderItems()
    {
        return $this->hasMany(OrderItem::class);
    }

    public function getAdminTotalAttribute()
    {
        return $this->orderItems->sum(function(OrderItem $item){
            return $item->admin_revenue;
        });
    }

    public function getInfluencerTotalAttribute()
    {
        return $this->orderItems->sum(function(OrderItem $item){
            return $item->influencer_revenue;
        });
    }

    public function getNameAttribute()
    {
        return $this->first_name.' '.$this->last_name;
    }
}
