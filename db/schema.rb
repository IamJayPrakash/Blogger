# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 20_230_926_014_047) do
  create_table 'action_text_rich_texts', force: :cascade do |t|
    t.string 'name', null: false
    t.text 'body'
    t.string 'record_type', null: false
    t.bigint 'record_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index %w[record_type record_id name], name: 'index_action_text_rich_texts_uniqueness', unique: true
  end

  create_table 'active_storage_attachments', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'record_type', null: false
    t.integer 'record_id', null: false
    t.integer 'blob_id', null: false
    t.datetime 'created_at', null: false
    t.index ['blob_id'],
            name: 'index_active_storage_attachments_on_blob_id'
    t.index %w[record_type record_id name blob_id], name: 'index_active_storage_attachments_uniqueness',
                                                    unique: true
  end

  create_table 'active_storage_blobs', force: :cascade do |t|
    t.string 'key', null: false
    t.string 'filename', null: false
    t.string 'content_type'
    t.text 'metadata'
    t.string 'service_name', null: false
    t.bigint 'byte_size', null: false
    t.string 'checksum'
    t.datetime 'created_at', null: false
    t.index ['key'], name: 'index_active_storage_blobs_on_key', unique: true
  end

  create_table 'active_storage_variant_records', force: :cascade do |t|
    t.integer 'blob_id', null: false
    t.string 'variation_digest', null: false
    t.index %w[blob_id variation_digest], name: 'index_active_storage_variant_records_uniqueness', unique: true
  end

  create_table 'comments', force: :cascade do |t|
    t.integer 'post_id', null: false
    t.integer 'user_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['post_id'], name: 'index_comments_on_post_id'
    t.index ['user_id'], name: 'index_comments_on_user_id'
  end

  create_table 'likes', force: :cascade do |t|
    t.integer 'user_id', null: false
    t.integer 'post_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['post_id'], name: 'index_likes_on_post_id'
    t.index %w[user_id post_id], name: 'index_likes_on_user_id_and_post_id', unique: true
    t.index ['user_id'], name: 'index_likes_on_user_id'
  end

  create_table 'notifications', force: :cascade do |t|
    t.string 'recipient_type', null: false
    t.integer 'recipient_id', null: false
    t.string 'type', null: false
    t.json 'params'
    t.datetime 'read_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'post_id'
    t.index ['post_id'], name: 'index_notifications_on_post_id'
    t.index ['read_at'], name: 'index_notifications_on_read_at'
    t.index %w[recipient_type recipient_id], name: 'index_notifications_on_recipient'
  end

  create_table 'pay_charges', force: :cascade do |t|
    t.integer 'customer_id', null: false
    t.integer 'subscription_id'
    t.string 'processor_id', null: false
    t.integer 'amount', null: false
    t.string 'currency'
    t.integer 'application_fee_amount'
    t.integer 'amount_refunded'
    t.json 'metadata'
    t.json 'data'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index %w[customer_id processor_id], name: 'index_pay_charges_on_customer_id_and_processor_id', unique: true
    t.index ['subscription_id'], name: 'index_pay_charges_on_subscription_id'
  end

  create_table 'pay_customers', force: :cascade do |t|
    t.string 'owner_type'
    t.bigint 'owner_id'
    t.string 'processor', null: false
    t.string 'processor_id'
    t.boolean 'default'
    t.json 'data'
    t.datetime 'deleted_at', precision: nil
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index %w[owner_type owner_id deleted_at default], name: 'pay_customer_owner_index'
    t.index %w[processor processor_id], name: 'index_pay_customers_on_processor_and_processor_id', unique: true
  end

  create_table 'pay_merchants', force: :cascade do |t|
    t.string 'owner_type'
    t.bigint 'owner_id'
    t.string 'processor', null: false
    t.string 'processor_id'
    t.boolean 'default'
    t.json 'data'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index %w[owner_type owner_id processor],
            name: 'index_pay_merchants_on_owner_type_and_owner_id_and_processor'
  end

  create_table 'pay_payment_methods', force: :cascade do |t|
    t.integer 'customer_id', null: false
    t.string 'processor_id', null: false
    t.boolean 'default'
    t.string 'type'
    t.json 'data'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index %w[customer_id processor_id], name: 'index_pay_payment_methods_on_customer_id_and_processor_id',
                                          unique: true
  end

  create_table 'pay_subscriptions', force: :cascade do |t|
    t.integer 'customer_id', null: false
    t.string 'name', null: false
    t.string 'processor_id', null: false
    t.string 'processor_plan', null: false
    t.integer 'quantity', default: 1, null: false
    t.string 'status', null: false
    t.datetime 'current_period_start', precision: nil
    t.datetime 'current_period_end', precision: nil
    t.datetime 'trial_ends_at', precision: nil
    t.datetime 'ends_at', precision: nil
    t.boolean 'metered'
    t.string 'pause_behavior'
    t.datetime 'pause_starts_at', precision: nil
    t.datetime 'pause_resumes_at', precision: nil
    t.decimal 'application_fee_percent', precision: 8, scale: 2
    t.json 'metadata'
    t.json 'data'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index %w[customer_id processor_id], name: 'index_pay_subscriptions_on_customer_id_and_processor_id',
                                          unique: true
    t.index ['metered'], name: 'index_pay_subscriptions_on_metered'
    t.index ['pause_starts_at'], name: 'index_pay_subscriptions_on_pause_starts_at'
  end

  create_table 'pay_webhooks', force: :cascade do |t|
    t.string 'processor'
    t.string 'event_type'
    t.json 'event'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'posts', force: :cascade do |t|
    t.string 'title'
    t.text 'body'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'view', default: 0
    t.integer 'user_id', null: false
    t.integer 'cached_votes_total', default: 0
    t.integer 'cached_votes_score', default: 0
    t.integer 'cached_votes_up', default: 0
    t.integer 'cached_votes_down', default: 0
    t.integer 'cached_weighted_score', default: 0
    t.integer 'cached_weighted_total', default: 0
    t.float 'cached_weighted_average', default: 0.0
    t.integer 'likes'
    t.string 'default'
    t.integer 'likes_count', default: 0
    t.string 'avatar'
    t.index ['user_id'], name: 'index_posts_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'views', default: 0
    t.string 'name'
    t.string 'role'
    t.string 'userimage'
    t.string 'stripe_customer_id'
    t.string 'plan'
    t.string 'subscription_status'
    t.datetime 'subscription_ends_at'
    t.string 'provider'
    t.string 'uid'
    t.string 'confirmation_token'
    t.datetime 'confirmed_at'
    t.datetime 'confirmation_sent_at'
    t.string 'unconfirmed_email'
    t.index ['confirmation_token'], name: 'index_users_on_confirmation_token', unique: true
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  create_table 'votes', force: :cascade do |t|
    t.string 'votable_type'
    t.integer 'votable_id'
    t.string 'voter_type'
    t.integer 'voter_id'
    t.boolean 'vote_flag'
    t.string 'vote_scope'
    t.integer 'vote_weight'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index %w[votable_id votable_type vote_scope],
            name: 'index_votes_on_votable_id_and_votable_type_and_vote_scope'
    t.index %w[votable_type votable_id], name: 'index_votes_on_votable'
    t.index %w[voter_id voter_type vote_scope], name: 'index_votes_on_voter_id_and_voter_type_and_vote_scope'
    t.index %w[voter_type voter_id], name: 'index_votes_on_voter'
  end

  add_foreign_key 'active_storage_attachments', 'active_storage_blobs', column: 'blob_id'
  add_foreign_key 'active_storage_variant_records', 'active_storage_blobs', column: 'blob_id'
  add_foreign_key 'comments', 'posts'
  add_foreign_key 'comments', 'users'
  add_foreign_key 'likes', 'posts'
  add_foreign_key 'likes', 'users'
  add_foreign_key 'notifications', 'posts'
  add_foreign_key 'pay_charges', 'pay_customers', column: 'customer_id'
  add_foreign_key 'pay_charges', 'pay_subscriptions', column: 'subscription_id'
  add_foreign_key 'pay_payment_methods', 'pay_customers', column: 'customer_id'
  add_foreign_key 'pay_subscriptions', 'pay_customers', column: 'customer_id'
  add_foreign_key 'posts', 'users'
end
